import { useDojo } from "@/dojo/useDojo";
import { Component, ComponentUpdate, defineEnterSystem, World } from "@dojoengine/recs";
import { useCallback, useEffect, useState } from "react";
import { defineComponentSystem } from "@dojoengine/recs";
import { AchievementCompletion, AchievementCreation } from "@/dojo/bindings/models.gen";

export const useEvents = ({ playerId }: { playerId: string | undefined }): { creations: AchievementCreation[], completions: AchievementCompletion[] } => {
  const [creations, setCreations] = useState<any>({});
  const [completions, setCompletions] = useState<any>({});

  const {
    setup: {
      contractModels: { AchievementCreation, AchievementCompletion },
      world,
    },
  } = useDojo();

  const handleAchievementCreation = useCallback((update: ComponentUpdate) => {
    setCreations((prev: any) => ({ ...prev, [update.value[0]?.identifier]: update.value[0] }));
  }, []);

  const handleAchievementCompletion = useCallback((update: ComponentUpdate) => {
    console.log('update', update, update.value[0]?.player_id, playerId);
    if (update.value[0]?.player_id !== BigInt(playerId || 0)) return;
    setCompletions((prev: any) => ({ ...prev, [update.value[0]?.identifier]: update.value[0] }));
  }, [playerId]);

  const createEventStream = useCallback((
    world: World,
    component: Component<any>,
    handler: (update: ComponentUpdate) => void
  ) => {
    defineComponentSystem(
      world,
      component,
      (update: ComponentUpdate) => {
        handler(update);
      },
      { runOnInit: false }
    );
  }, []);

  useEffect(() => {
    createEventStream(world, AchievementCreation, handleAchievementCreation);
    createEventStream(world, AchievementCompletion, handleAchievementCompletion);
  }, [world, createEventStream, handleAchievementCreation, handleAchievementCompletion]);

  return {
    creations: Object.values(creations),
    completions: Object.values(completions)
  };
};
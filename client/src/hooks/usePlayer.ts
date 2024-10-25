import { useDojo } from "@/dojo/useDojo";
import { useMemo } from "react";
import { getEntityIdFromKeys } from "@dojoengine/utils";
import { useComponentValue } from "@dojoengine/react";
import { Entity } from "@dojoengine/recs";

export const usePlayer = ({ playerId }: { playerId: string | undefined }) => {
  const {
    setup: {
      clientModels: {
        Player,
        classes: { Player: PlayerClass },
      },
    },
  } = useDojo();

  const key = useMemo(
    () => getEntityIdFromKeys([BigInt(playerId || 0)]) as Entity,
    [playerId],
  );
  const component = useComponentValue(Player, key);
  const player = useMemo(() => {
    return component ? new PlayerClass(component) : null;
  }, [component]);
  return { player, key };
};

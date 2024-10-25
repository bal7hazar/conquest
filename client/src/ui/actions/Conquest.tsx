import { useDojo } from "@/dojo/useDojo";
import { useState, useCallback, useMemo } from "react";
import { Button } from "@/ui/elements/button";

export const Conquest = ({ ownedTileIds, consecutiveTileIds }: { ownedTileIds: number[], consecutiveTileIds: number[] }) => {
  const {
    account: { account },
    master,
    setup: {
      systemCalls: { conquest_verify },
    },
  } = useDojo();

  const handleClick = useCallback(async () => {
    try {
      await conquest_verify({
        account,
        owned_tile_ids: ownedTileIds,
        consecutive_tile_ids: consecutiveTileIds,
      });
    } catch (error) {
      console.error(error);
    }
  }, [
    account,
    ownedTileIds,
    consecutiveTileIds,
  ]);

  const disabled = useMemo(() => {
    return !account || !master || account === master;
  }, [account, master]);

  if (disabled) return null;

  return (
    <Button disabled={disabled} onClick={handleClick}>Conquest</Button>
  );
};
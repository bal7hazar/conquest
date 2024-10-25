import { useDojo } from "@/dojo/useDojo";
import { useState, useCallback, useMemo } from "react";
import { Button } from "@/ui/elements/button";

export const Verify = ({ quest, label }: { quest: number, label: string }) => {
  const {
    account: { account },
    master,
    setup: {
      systemCalls: { verify },
    },
  } = useDojo();

  const handleClick = useCallback(async () => {
    try {
      await verify({
        account,
        quest,
      });
    } catch (error) {
      console.error(error);
    }
  }, [
    account,
    quest,
  ]);

  const disabled = useMemo(() => {
    return !account || !master || account === master;
  }, [account, master]);

  if (disabled) return null;

  return (
    <Button disabled={disabled} onClick={handleClick}>{label}</Button>
  );
};
import { useDojo } from "@/dojo/useDojo";
import { usePlayer } from "@/hooks/usePlayer";
import { Conquest } from "../actions/Conquest";
import { Verify } from "../actions/Verify";
import { Signup } from "../actions/Signup";
import { useTiles } from "@/hooks/useTiles";
import { Tile } from "@/dojo/models/tile";
import Quest from "@/dojo/types/quest";
import { Connection } from "../components/Connection";

const QUESTS: string[] = [
  "Squire",
  "Explorer",
  "Battlelord",
  "Conqueror",
  "Breeder",
  "Strategist",
  "Opportunist",
  "Ruler",
  "Maximalist",
  "Warlord",
]

export const Overlay = () => {
  const {
    account: { account },
  } = useDojo();

  const { player } = usePlayer({ playerId: account?.address });
  const { tiles } = useTiles({ playerId: account?.address });

  return (
    <div className={`absolute top-12 left-1/2 -translate-x-1/2 w-full`}>
      {!account && <WelcomeVisitor />}
      {!!account && !player && <WelcomeScene />}
      {!!account && !!player && <GameScene tiles={tiles} playerId={account?.address} />}
    </div>
  )
};

export const WelcomeVisitor = () => {
  return (
    <div className="flex flex-col gap-8 items-center absolute w-36 left-1/2 -translate-x-1/2 top-48">
      <h1 className="text-4xl text-center">Welcome to Conquest</h1>
      <Connection />
    </div>
  );
}

export const WelcomeScene = () => {
  return (
    <div className="flex flex-col gap-8 items-center absolute w-36 left-1/2 -translate-x-1/2 top-48">
      <h1 className="text-4xl text-center">Welcome to Conquest</h1>
      <Signup />
    </div>
  );
}

export const GameScene = ({ tiles, playerId }: { tiles: Tile[], playerId: string }) => {
  return (
    <div className="flex flex-col gap-8 items-center absolute w-36 left-1/2 -translate-x-1/2 top-48">
      <h1 className="text-4xl text-center">Click to Conquer</h1>
      <div className="flex gap-1">
        <Conquest ownedTileIds={Quest.getOwnedTiles(tiles)} consecutiveTileIds={Quest.getConsecutiveTiles(tiles)} />
        {Array.from({ length: QUESTS.length }).map((_, index) => (
          <Verify key={index} quest={index + 1} label={QUESTS[index]} />
        ))}
      </div>
      <div>
        <p>{`Tiles: ${tiles.length}`}</p>
      </div>
    </div>
  );
}
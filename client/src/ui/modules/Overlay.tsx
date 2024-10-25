import { useDojo } from "@/dojo/useDojo";
import { usePlayer } from "@/hooks/usePlayer";
import { Conquest } from "../actions/Conquest";
import { Verify } from "../actions/Verify";
import { Signup } from "../actions/Signup";
import { useTiles } from "@/hooks/useTiles";
import { Tile } from "@/dojo/models/tile";
import { useEvents } from "@/hooks/useEvents";
import { 
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "../elements/card";
import { Progress } from "../elements/ui/progress";
import { AchievementCompletion, AchievementCreation } from "@/dojo/bindings/models.gen";
import Quest from "@/dojo/types/quest";
import { Connection } from "../components/Connection";
import { shortString } from "starknet";

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
  const { creations, completions } = useEvents({ playerId: account?.address });

  return (
    <div className={`absolute top-12 left-1/2 -translate-x-1/2 w-full`}>
      {!account && <WelcomeVisitor />}
      {!!account && !player && <WelcomeScene />}
      {!!account && !!player && <GameScene tiles={tiles} creations={creations} completions={completions} playerId={account?.address} />}
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

export const GameScene = ({ tiles, creations, completions, playerId }: { tiles: Tile[], creations: AchievementCreation[], completions: AchievementCompletion[], playerId: string }) => {
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
      <Achievements creations={creations} completions={completions} playerId={playerId} />
    </div>
  );
}

export const Achievements = ({ creations, completions, playerId }: { creations: AchievementCreation[], completions: AchievementCompletion[], playerId: string }) => {
  const sortedCreations = creations.sort((a: AchievementCreation, b: AchievementCreation) => parseInt(a.identifier.toString(10).slice(1)) - parseInt(b.identifier.toString(10).slice(1)));
  return (
    <div className="flex flex-col gap-8 items-center">
      <h1 className="text-4xl text-center">Achievements</h1>
      <div className="flex gap-4">
        {sortedCreations.map((creation: any) => (
          <Achievement key={creation.identifier} creation={creation} completions={completions} playerId={playerId} />
        ))}
      </div>
    </div>
  );
}

export const Achievement = ({ creation, completions, playerId }: { creation: AchievementCreation, completions: AchievementCompletion[], playerId: string }) => {
  const filteredCompletions = completions.filter((completion) => completion.quest === creation.quest && completion.player_id === BigInt(playerId));
  const completion = filteredCompletions.reduce((max, completion) => completion.count > max.count ? completion : max, filteredCompletions[0]);
  const count = completion ? Number(completion.count) : 0;
  return (
    <Card className={`w-[150px] ${count === 100 ? 'border-green-500' : 'border-orange-500'}`}>
      <div className="flex flex-col justify-between h-full">
        <CardHeader>
          <CardTitle>{`${creation.title}`}</CardTitle>
          <CardDescription>{`${creation.description}`}</CardDescription>
        </CardHeader>
        <CardContent className="flex flex-col items-center">
          {/* <FontAwesomeIcon className="w-16 h-16" icon={faTrophy} /> */}
          {/* <FontAwesomeIcon className="w-16 h-16" icon={{ prefix: "fas" as IconPrefix, iconName: 'trophy' as IconName }} /> */}
          {/* <div className={`w-16 h-16 fa-solid fa-thumbs-up`} /> */}
          <div className={`w-16 h-16 fa-spider-web fa-thin`} />
          <p>{`${count}%`}</p>
          <Progress value={count} />
        </CardContent>
      </div>
    </Card>
  );
}
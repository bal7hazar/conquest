import { useDojo } from "@/dojo/useDojo";
import { usePlayer } from "@/hooks/usePlayer";
import { Conquest } from "../actions/Conquest";
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

export const Overlay = () => {
  const {
    account: { account },
  } = useDojo();

  console.log('account', account);

  const { player } = usePlayer({ playerId: account?.address });
  const { tiles } = useTiles({ playerId: account?.address });
  const { creations, completions } = useEvents({ playerId: account?.address });

  console.log('completions', completions);

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
      <Conquest ownedTileIds={Quest.getOwnedTiles(tiles)} consecutiveTileIds={Quest.getConsecutiveTiles(tiles)} />
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
  const filteredCompletions = completions.filter((completion) => completion.identifier === creation.identifier && completion.player_id === BigInt(playerId));
  const completion = filteredCompletions.reduce((max, completion) => completion.progress > max.progress ? completion : max, filteredCompletions[0]);
  const progress = completion ? Number(completion.progress) : 0;
  return (
    <Card className={`w-[150px] ${progress === 100 ? 'border-green-500' : 'border-orange-500'}`}>
      <div className="flex flex-col justify-between h-full">
        <CardHeader>
          <CardTitle>{`${creation.title}`}</CardTitle>
          <CardDescription>{`${creation.description}`}</CardDescription>
        </CardHeader>
        <CardContent className="flex flex-col items-center">
          <img className="w-16 h-16 rounded-full object-cover" src={`${creation.image_uri}`} alt={`${creation.title}`} />
          <p>{`${progress}%`}</p>
          <Progress value={progress} />
        </CardContent>
      </div>
    </Card>
  );
}
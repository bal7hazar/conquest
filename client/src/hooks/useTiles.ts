import { useDojo } from "@/dojo/useDojo";
import { useEffect, useState } from "react";
import { useEntityQuery } from "@dojoengine/react";
import { Has, HasValue, getComponentValue } from "@dojoengine/recs";
import { Tile } from "@/dojo/models/tile";

export const useTiles = ({ playerId }: { playerId: string | undefined }): { tiles: Tile[] } => {
  const [tiles, setTiles] = useState<{ [key: string]: Tile }>({});

  const {
    setup: {
      clientModels: {
        Tile,
        classes: { Tile: TileClass },
      },
    },
  } = useDojo();

  const tileKeys = useEntityQuery([Has(Tile), HasValue(Tile, { player_id: BigInt(playerId || 0) })]);

  useEffect(() => {
    const components = tileKeys.map((entity) => {
      const component = getComponentValue(Tile, entity);
      if (!component) {
        return undefined;
      }
      return new TileClass(component);
    });

    const objectified = components.reduce(
      (obj: any, tile: Tile | undefined) => {
        if (tile) {
          obj[`${tile.id}`] = tile;
        }
        return obj;
      },
      {},
    );

    setTiles(objectified);
  }, [tileKeys]);

  return { tiles: Object.values(tiles).sort((a: Tile, b: Tile) => a.id - b.id) };
};

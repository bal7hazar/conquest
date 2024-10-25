import { ContractComponents } from "./bindings/models.gen";
import { overridableComponent } from "@dojoengine/recs";
import { Player } from "./models/player";
import { Tile } from "./models/tile";

export type ClientModels = ReturnType<typeof models>;

export function models({
  contractModels,
}: {
  contractModels: ContractComponents;
}) {
  return {
    ...contractModels,
    classes: {
      Player,
      Tile,
    },
  };
}

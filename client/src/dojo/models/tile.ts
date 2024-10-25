import { ComponentValue } from "@dojoengine/recs";

export class Tile {
  public id: number;
  public playerId: string;
  public time: number;

  constructor(component: ComponentValue) {
    this.id = component.id;
    this.playerId = `0x${component.player_id.toString(16)}`.replace("0x0x", "0x");
    this.time = component.time;
  }
}

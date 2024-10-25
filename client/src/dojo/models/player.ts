import { ComponentValue } from "@dojoengine/recs";
import { shortenHex } from "@dojoengine/utils";
import { shortString } from "starknet";

export class Player {
  public id: string;
  public name: string;

  constructor(component: ComponentValue) {
    this.id = `0x${component.id.toString(16)}`.replace("0x0x", "0x");
    this.name = shortString.decodeShortString(component.name);
  }

  getShortName(): string {
    return shortenHex(this.id);
  }
}

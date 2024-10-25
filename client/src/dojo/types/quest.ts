import { Tile } from "../models/tile";

const Quest = {
  getConsecutiveTiles(tiles: Tile[]) {
    // Loop through tiles and pickup 3 tiles conquered by the player in 3 consecutive minutes
    let tileIds: number[] = [];
    let minute = 0;
    for (let i = 0; i < tiles.length; i++) {
      const currentMinute = Math.floor(tiles[i].time / 60);
      if (currentMinute == minute + 1 || minute == 0 ) {
        tileIds.push(tiles[i].id);
        minute = currentMinute;
      } else if (currentMinute !== minute) {
        tileIds = [tiles[i].id];
        minute = currentMinute;
      }
      if (tileIds.length == 3) {
        break;
      }
    }
    return tileIds;
  },

  getOwnedTiles(tiles: Tile[]) {
    // Return 3 first tile ids
    return tiles.slice(0, 3).map((tile) => tile.id);
  },
};

export default Quest;
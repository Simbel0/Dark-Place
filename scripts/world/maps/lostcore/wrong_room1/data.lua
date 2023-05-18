return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 14,
  properties = {
    ["light"] = true,
    ["music"] = "lostcore"
  },
  tilesets = {
    {
      name = "core_tileset",
      firstgid = 1,
      filename = "../../../tilesets/core_tileset.tsx",
      exportfilename = "../../../tilesets/core_tileset.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 1,
      name = "Calque de Tuiles 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 26, 44, 44, 44, 44, 44, 25, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 44, 44, 44, 44, 44, 43, 43, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 44, 62, 92, 91, 92, 61, 43, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 62, 80, 23, 23, 23, 79, 61, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 80, 23, 23, 23, 23, 23, 79, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 22, 23, 23, 23, 23, 23, 24, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 22, 23, 23, 23, 23, 23, 24, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 22, 23, 23, 23, 23, 23, 24, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 40, 23, 23, 23, 23, 23, 42, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 40, 23, 23, 23, 42, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 22, 23, 24, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 22, 23, 24, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collisions",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 200,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 360,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 360,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 200,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "polygon",
          x = 160,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 80, y = -80 },
            { x = 80, y = -120 },
            { x = 0, y = -120 }
          },
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "polygon",
          x = 440,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -120 },
            { x = -80, y = -120 },
            { x = -80, y = -80 }
          },
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 80,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "NPC",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "viro",
            ["solid"] = false
          }
        },
        {
          id = 2,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 480,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "lostcore/first_room",
            ["marker"] = "entry_w"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 12,
          name = "entry",
          type = "",
          shape = "point",
          x = 300,
          y = 434.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "spawn",
          type = "",
          shape = "point",
          x = 360,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}

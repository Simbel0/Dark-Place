return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.8.6",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 30,
  properties = {
    ["border"] = "undertale/dog",
    ["music"] = "greenroom"
  },
  tilesets = {
    {
      name = "greenroom",
      firstgid = 1,
      filename = "../../../tilesets/greenroom.tsx",
      exportfilename = "../../../tilesets/greenroom.lua"
    },
    {
      name = "floor3_objects",
      firstgid = 36,
      filename = "../../../tilesets/floor3-objects.tsx",
      exportfilename = "../../../tilesets/floor3-objects.lua"
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
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        21, 21, 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 21, 21, 21, 21,
        21, 21, 21, 21, 0, 2, 1, 2, 1, 2, 1, 0, 21, 21, 21, 21,
        21, 21, 21, 21, 0, 9, 8, 9, 8, 9, 8, 0, 21, 21, 21, 21,
        21, 21, 21, 21, 0, 16, 15, 16, 15, 16, 15, 0, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 3, 3, 3, 3, 3, 3, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 10, 10, 10, 10, 10, 11, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 10, 10, 10, 10, 11, 12, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 10, 10, 10, 11, 12, 12, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 10, 10, 11, 12, 12, 12, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 10, 11, 12, 12, 12, 6, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 11, 12, 12, 12, 6, 10, 21, 21, 21, 21, 21,
        21, 21, 21, 21, 21, 12, 12, 12, 6, 10, 10, 21, 21, 21, 21, 21
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "collision",
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
          x = 206,
          y = 160,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 372,
          y = 160,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 120,
          width = 80,
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
          x = 360,
          y = 120,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 160,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 200,
          width = 74,
          height = 90,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 366,
          y = 200,
          width = 74,
          height = 90,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 145,
          width = 80,
          height = 5,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "elevator",
            ["marker"] = "entry"
          }
        },
        {
          id = 24,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 470,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "floor3/pre_elevator",
            ["marker"] = "entry"
          }
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 282,
          y = 160,
          width = 76,
          height = 104,
          rotation = 0,
          gid = 43,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "markers",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 25,
          name = "entry",
          type = "",
          shape = "point",
          x = 320,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "entry_elevator",
          type = "",
          shape = "point",
          x = 320,
          y = 210,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_fg",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 194,
          y = 80,
          width = 70,
          height = 40,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 258,
          y = 80,
          width = 70,
          height = 40,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 322,
          y = 80,
          width = 70,
          height = 40,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 386,
          y = 80,
          width = 70,
          height = 40,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "greenroom_sparkles",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 40,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 6,
      name = "Tile Layer 2",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 21, 21, 21, 21, 21, 21, 21, 21, 0, 0, 0, 0,
        0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0,
        0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0,
        0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using SonicRetro.SonLVL.API;

namespace S3KObjectDefinitions.GHZ
{
	class FloatingPlatform : Common.FloatingPlatform
	{
		public override void Init(ObjectData data)
		{
			var indexer = new MultiFileIndexer<byte>();
			indexer.AddFile(new List<byte>(LevelData.ReadFile("LevelArt", 0)), 0);

			BuildSprites(indexer.ToArray(),
				System.IO.File.ReadAllBytes("../Objects/Floating Platform/Object Data/Map - Floating Platform (GHZ).bin"), 0x00);
		}
	}
}

namespace S3KObjectDefinitions.SSLZ
{
	class FloatingPlatform : Common.FloatingPlatform
	{
		public override void Init(ObjectData data)
		{
			var indexer = new MultiFileIndexer<byte>();
			indexer.AddFile(new List<byte>(LevelData.ReadFile("LevelArt", 0)), 0);

			BuildSprites(indexer.ToArray(),
				System.IO.File.ReadAllBytes("../Objects/Floating Platform/Object Data/Map - Floating Platform (SSLZ).bin"), 0x00);
		}
	}
}


namespace S3KObjectDefinitions.TTPZ
{
	class FloatingPlatform : Common.FloatingPlatform
	{
		public override void Init(ObjectData data)
		{
			var indexer = new MultiFileIndexer<byte>();
			indexer.AddFile(new List<byte>(LevelData.ReadFile("LevelArt", 0)), 0);

			BuildSprites(indexer.ToArray(),
				System.IO.File.ReadAllBytes("../Objects/Floating Platform/Object Data/Map - Floating Platform.bin"), 0x00);
		}
	}
}

namespace S3KObjectDefinitions.TTSZ
{
	class FloatingPlatform : Common.FloatingPlatform
	{
		public override void Init(ObjectData data)
		{
			var indexer = new MultiFileIndexer<byte>();
			indexer.AddFile(new List<byte>(LevelData.ReadFile("LevelArt", 0)), 0);

			BuildSprites(indexer.ToArray(),
				System.IO.File.ReadAllBytes("../Objects/Floating Platform/Object Data/Map - Floating Platform.bin"), 0x00);
		}
	}
}


namespace S3KObjectDefinitions.Common
{
	abstract class FloatingPlatform : ObjectDefinition
	{
		protected PropertySpec[] properties;
		private ReadOnlyCollection<byte> subtypes;
		private Sprite sprite;

		protected Sprite[] overlays;
		private Sprite[] unknownSprite;
		private byte defaultSubtype;

		public override string Name
		{
			get { return "Floating Platform"; }
		}

		public override Sprite Image
		{
			get { return sprite; }
		}

		public override PropertySpec[] CustomProperties
		{
			get { return properties; }
		}

		public override ReadOnlyCollection<byte> Subtypes
		{
			get { return subtypes; }
		}

		public override byte DefaultSubtype
		{
			get { return defaultSubtype; }
		}

		public override string SubtypeName(byte subtype)
		{
			return null;
		}

		public override Sprite SubtypeImage(byte subtype)
		{
			return sprite;
		}

		public override Sprite GetSprite(ObjectEntry obj)
		{
			var routine = obj.SubType & 0x0F;
			if (routine >= overlays.Length || (obj.SubType & 0x70) != defaultSubtype)
				return unknownSprite[(obj.XFlip ? 1 : 0) | (obj.YFlip ? 2 : 0)];

			if (obj.XFlip)
			{
				switch (routine)
				{
					case 0x01: return new Sprite(sprite, 0x40, 0);
					case 0x02: return new Sprite(sprite, 0x80, 0);
					case 0x03: return new Sprite(sprite, 0, -0x40);
					case 0x04: return new Sprite(sprite, 0, -0x80);
					case 0x05: return new Sprite(sprite, 0x80, -0x40);
					case 0x06: return new Sprite(sprite, 0, -0x40);
				}
			}

			switch (routine)
			{
				case 0x06: return new Sprite(sprite, 0x80, 0);
				case 0x08: return new Sprite(sprite, -0x10, -0x10);
				case 0x09: return new Sprite(sprite, -0x30, -0x30);
				case 0x0A: return new Sprite(sprite, -0x50, -0x50);
				case 0x0B: return new Sprite(sprite, -0x70, -0x70);
				case 0x0C: return new Sprite(sprite, 0x80, 0);
			}

			return sprite;
		}

		public override Sprite GetDebugOverlay(ObjectEntry obj)
		{
			var routine = obj.SubType & 0x0F;
			if (routine >= overlays.Length) return null;
			if (routine != 7) return overlays[routine];

			var ceiling = FindCeiling(obj);
			if (ceiling == 0) return null;

			var overlay = new BitmapBits(sprite.Width, sprite.Bottom * 2);
			overlay.DrawRectangle(LevelData.ColorWhite, 0, 0, overlay.Width - 1, overlay.Height - 1);
			return new Sprite(overlay, sprite.X, ceiling - obj.Y);
		}

		public override int GetDepth(ObjectEntry obj)
		{
			return 3;
		}

		protected void BuildSprites(byte[] art, byte[] map, byte defaultSubtype)
		{
			sprite = ObjectHelper.MapToBmp(art, map, 0, 2);
			subtypes = new ReadOnlyCollection<byte>(new byte[0]);
			properties = new PropertySpec[1];

			unknownSprite = BuildFlippedSprites(ObjectHelper.UnknownObject);
			this.defaultSubtype = defaultSubtype;

			overlays = new Sprite[15];
			overlays[1] = Line(0x40, 0);
			overlays[2] = Line(0x80, 0);
			overlays[3] = Line(0, 0x40);
			overlays[4] = Line(0, 0x80);
			overlays[5] = Line(0x80, 0x40);
			overlays[6] = new Sprite(overlays[5], 0x80, 0, true, false);
			overlays[8] = Square(0x10);
			overlays[9] = Square(0x30);
			overlays[10] = Square(0x50);
			overlays[11] = Square(0x70);
			overlays[12] = Line(0x100, 0);
			overlays[12].Offset(-0x80, 0);
			var bitmap = new BitmapBits(1, 0x1C);
			bitmap.DrawLine(LevelData.ColorWhite, 0, 0x00, 0, 0x03);
			bitmap.DrawLine(LevelData.ColorWhite, 0, 0x08, 0, 0x0B);
			bitmap.DrawLine(LevelData.ColorWhite, 0, 0x10, 0, 0x13);
			bitmap.DrawLine(LevelData.ColorWhite, 0, 0x18, 0, 0x1B);
			overlays[13] = new Sprite(bitmap, 0, 4);
			overlays[14] = overlays[13];

			properties[0] = new PropertySpec("Movement", typeof(int), "Extended",
				"The object's movement pattern.", null, new Dictionary<string, int>
				{
					{ "None", 0 },
					{ "Vertical (64px)", 3 },
					{ "Vertical (128px)", 4 },
					{ "Horizontal (64px)", 1 },
					{ "Horizontal (128px)", 2 },
					{ "Horizontal (256px)", 12 },
					{ "Square (32px)", 8 },
					{ "Square (96px)", 9 },
					{ "Square (160px)", 10 },
					{ "Square (224px)", 11 },
					{ "Diagonal Right", 5 },
					{ "Diagonal Left", 6 },
					{ "Ceiling Crush", 7 },
					{ "Falling (delay)", 13 },
					{ "Falling (instant)", 14 }
				},
				(obj) => obj.SubType < 0x80 ? obj.SubType & 0x0F : 0x80,
				(obj, value) => obj.SubType = (byte)(defaultSubtype | ((int)value & 0x8F)));
		}

		private Sprite[] BuildFlippedSprites(Sprite sprite)
		{
			var flipX = new Sprite(sprite, true, false);
			var flipY = new Sprite(sprite, false, true);
			var flipXY = new Sprite(sprite, true, true);

			return new[] { sprite, flipX, flipY, flipXY };
		}

		protected Sprite Line(int width, int height)
		{
			var overlay = new BitmapBits(width + 1, height + 1);
			overlay.DrawLine(LevelData.ColorWhite, 0, height, width, 0);
			return new Sprite(overlay, 0, -height);
		}

		private Sprite Square(int radius)
		{
			var length = radius * 2;
			var overlay = new BitmapBits(length + 1, length + 1);
			overlay.DrawRectangle(LevelData.ColorWhite, 0, 0, length, length);
			return new Sprite(overlay, -radius, -radius);
		}

		private int FindCeiling(ObjectEntry obj)
		{
			var objY = obj.Y + sprite.Top - 1;
			if (objY < 0) return 0;

			var chunkY = objY / LevelData.Level.ChunkHeight;
			if (chunkY >= LevelData.FGHeight) return 0;

			var chunkX = obj.X / LevelData.Level.ChunkWidth;
			var blockX = obj.X % LevelData.Level.ChunkWidth / 16;
			var solidX = obj.X % 16;
			var foundEmpty = false;

			while (true)
			{
				var chunk = LevelData.Chunks[LevelData.Layout.FGLayout[chunkX, chunkY]];
				var block = chunk.Blocks[blockX, objY % LevelData.Level.ChunkHeight / 16];
				var index = LevelData.GetColInd1(block.Block);
				var solid = LevelData.ColArr1[index][block.XFlip ? 15 - solidX : solidX];

				if (solid == 0 || (block.Solid1 & Solidity.LRBSolid) == 0)
				{
					objY = objY - 16;
					if (objY < 0) return 0;
					chunkY = objY / LevelData.Level.ChunkHeight;
					foundEmpty = true;
				}
				else if (!foundEmpty && solid == 16)
				{
					objY = objY + 16;
					chunkY = objY / LevelData.Level.ChunkHeight;
					if (chunkY >= LevelData.FGHeight) return 0;
				}
				else
				{
					var height = Math.Abs(index);
					var inverted = block.YFlip ^ solid < 0;
					return (objY & 0xFF0) + (inverted ? solid : 16);
				}
			}
		}
	}
}

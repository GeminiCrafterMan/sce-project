using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using SonicRetro.SonLVL.API;

namespace S3KObjectDefinitions.Common
{
	class ConveyorBelt : ObjectDefinition
	{
		private Sprite[] img;

		public override void Init(ObjectData data)
		{
			var artfile = ObjectHelper.OpenArtFile("Common/RingHUDText.bin", CompressionType.KosinskiM);
			var sprite = ObjectHelper.MapToBmp(artfile, System.IO.File.ReadAllBytes("../Objects/Invisible Blocks/Object Data/Map - Invisible Block.bin"), 0, 0);
			sprite.InvertPriority();

			img = new[]
			{
				sprite,
				new Sprite(sprite, true, false),
				new Sprite(sprite, false, true),
				new Sprite(sprite, true, true)
			};
		}

		public override ReadOnlyCollection<byte> Subtypes
		{
			get { return new ReadOnlyCollection<byte>(new byte[] { 0 }); }
		}

		public override string Name
		{
			get { return "Conveyor Belt"; }
		}

		public override string SubtypeName(byte subtype)
		{
			return ((subtype & 0xF) * 2) + " blocks";
		}

		public override Sprite Image
		{
			get { return img[0]; }
		}

		public override Sprite SubtypeImage(byte subtype)
		{
			return img[0];
		}

		public override Sprite GetSprite(ObjectEntry obj)
		{
			return img[(obj.XFlip ? 1 : 0) | (obj.YFlip ? 2 : 0)];
		}

		public override Sprite GetDebugOverlay(ObjectEntry obj)
		{
			int w = (obj.SubType & 0xF) * 16;
			int h = 3 * 16;
			BitmapBits bmp = new BitmapBits(w*2, h);
			if (obj.XFlip) {
				bmp.DrawLine(LevelData.ColorWhite, -w*2 + 1, (h/2), w, (h/2));
			} else {
				bmp.DrawLine(LevelData.ColorWhite, w, (h/2), w*2 - 1, (h/2));
			}
			bmp.DrawRectangle(LevelData.ColorWhite, 0, 0, w*2 - 1, h - 1);
			return new Sprite(bmp, -w, -h+16);
		}

		public override Rectangle GetBounds(ObjectEntry obj)
		{
			int w = (obj.SubType & 0xF) * 16;
			int h = 3 * 16;
			return new Rectangle(obj.X - w, obj.Y - h+16, w*2, h);
		}

		public override int GetDepth(ObjectEntry obj)
		{
			return 4;
		}

		public override bool Debug { get { return true; } }

		private PropertySpec[] customProperties = new PropertySpec[] {
			new PropertySpec("Width", typeof(int), "Extended", null, null, GetWidth, SetWidth)
		};

		public override PropertySpec[] CustomProperties
		{
			get
			{
				return customProperties;
			}
		}

		private static object GetWidth(ObjectEntry obj)
		{
			return obj.SubType & 0xF;
		}

		private static void SetWidth(ObjectEntry obj, object value)
		{
			obj.SubType = (byte)(Math.Min((int)value, 0xF) | (obj.SubType & 0xF0));
		}
	}
}

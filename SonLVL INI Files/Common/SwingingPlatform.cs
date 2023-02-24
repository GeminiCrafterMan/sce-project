using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using SonicRetro.SonLVL.API;

namespace S3KObjectDefinitions.GHZ
{
	class SwingingPlatform : Common.SwingingPlatform
	{
		public override void Init(ObjectData data)
		{
			imgsaw = ObjectHelper.MapToBmp(ObjectHelper.OpenArtFile("../Objects/Swinging Platform/Uncompressed Art/Saw.bin", CompressionType.Uncompressed), System.IO.File.ReadAllBytes("../Objects/Swinging Platform/Object Data/Map - Saw.bin"), 1, 0);
			for (int i = 0; i < labels.Length; i++)
				imgs.Add(ObjectHelper.MapToBmp(ObjectHelper.OpenArtFile("../Objects/Swinging Platform/KosinskiM Art/Swinging Platform.bin", CompressionType.KosinskiM), System.IO.File.ReadAllBytes("../Objects/Swinging Platform/Object Data/Map - Swinging Platform.bin"), labels[i], i == 1 ? 0 : 2));
		}
	}
}

namespace S3KObjectDefinitions.Common
{
	class SwingingPlatform : ObjectDefinition
	{
		public int[] labels = { 0, 1, 2 };
		public Sprite imgsaw;
		public List<Sprite> imgs = new List<Sprite>();

		public override void Init(ObjectData data)
		{
			imgsaw = ObjectHelper.MapToBmp(ObjectHelper.OpenArtFile("../Objects/Swinging Platform/Uncompressed Art/Saw.bin", CompressionType.Uncompressed), System.IO.File.ReadAllBytes("../Objects/Swinging Platform/Object Data/Map - Saw.bin"), 1, 2);
			for (int i = 0; i < labels.Length; i++)
				imgs.Add(ObjectHelper.MapToBmp(ObjectHelper.OpenArtFile("../Objects/Swinging Platform/KosinskiM Art/Swinging Platform.bin", CompressionType.KosinskiM), System.IO.File.ReadAllBytes("../Objects/Swinging Platform/Object Data/Map - Swinging Platform.bin"), labels[i], i == 1 ? 0 : 2));
		}

		public override ReadOnlyCollection<byte> Subtypes
		{
			get { return new ReadOnlyCollection<byte>(new byte[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 }); }
		}

		public override string Name
		{
			get { return "Swinging Platform"; }
		}

		public override bool RememberState
		{
			get { return false; }
		}

		public override string SubtypeName(byte subtype)
		{
			if ((subtype & 0x60) != 0)
				return (subtype & 0x0F) + " links + saw";
			else
				return (subtype & 0x0F) + " links";
		}

		public override Sprite Image
		{
			get { return imgs[0]; }
		}

		public override Sprite SubtypeImage(byte subtype)
		{
			if ((subtype & 0x60) != 0)
				return imgsaw;
			else
				return imgs[0];
		}

		public override Sprite GetSprite(ObjectEntry obj)
		{
			int chainLength = obj.SubType & 0x0F;
			List<Sprite> sprs = new List<Sprite>() { imgs[2] };
			int yoff = 16;
			for (int i = 0; i < chainLength; i++)
			{
				Sprite tmp = new Sprite(imgs[1]);
				tmp.Offset(0, yoff);
				sprs.Add(tmp);
				yoff += 16;
			}
			yoff -= 8;
			Sprite tm2 = new Sprite(SubtypeImage(obj.SubType));
			tm2.Offset(0, yoff);
			sprs.Add(tm2);
			return new Sprite(sprs.ToArray());
		}

		public override Sprite GetDebugOverlay(ObjectEntry obj)
		{
			int chainLength = obj.SubType & 0x0F;
			int pixelsLength = ((chainLength) * 16);
			var bitmap = new BitmapBits(pixelsLength * 2, pixelsLength);

			bitmap.DrawCircle(LevelData.ColorWhite, bitmap.Width / 2 - 1, bitmap.Height - 1, pixelsLength - 1);

			var overlay = new Sprite(bitmap);
			overlay.Offset(-bitmap.Width / 2 - 1, -pixelsLength/2 - bitmap.Height / 2 - 1);
			overlay.Flip(obj.XFlip, true);
			return overlay;
		}

		private PropertySpec[] customProperties = new PropertySpec[] {
			new PropertySpec("Chainlinks", typeof(int), "Extended", null, null, GetChainlinks, SetChainlinks),
			new PropertySpec("Saw", typeof(bool), "Extended", null, null, GetSaw, SetSaw)
		};

		public override PropertySpec[] CustomProperties
		{
			get
			{
				return customProperties;
			}
		}

		private static object GetChainlinks(ObjectEntry obj)
		{
			return obj.SubType & 0x0F;
		}

		private static void SetChainlinks(ObjectEntry obj, object value)
		{
			value = Math.Max(0, (Math.Min(0x0D, (int)value)));
			obj.SubType = (byte)((obj.SubType & ~0x0F) | (int)value);
		}

		private static object GetSaw(ObjectEntry obj)
		{
			return (obj.SubType & 0x60) != 0 ? true : false;
		}

		private static void SetSaw(ObjectEntry obj, object value)
		{
			obj.SubType = (byte)((obj.SubType & ~0x60) | ((bool)value == true ? 0x60 : 0));
		}
	}
}

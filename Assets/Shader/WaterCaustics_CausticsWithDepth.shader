Shader "WaterCaustics/CausticsWithDepth" {
	Properties {
		_MainTex ("Main Texture", 2D) = "" {}
		_Color ("Tint", Vector) = (1,1,1,1)
		_ShadowTex ("Cookie", 2D) = "" {}
		_DistTex ("Distort Texture", 2D) = "" {}
		_maxTileNum ("Max Tile Num", Float) = 10
		_minTileNum ("Min Tile Num", Float) = 3
		_WaveSpd ("Wave Speed", Range(0, 1)) = 0.15
		_Dspd ("dsp", Range(0, 1)) = 1
		_CustomTime ("Custom Time", Range(0, 1)) = 0
		_UseCustomTime ("Use CustomTime", Float) = 0
		_WaveDirection ("Wave Direction", Float) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		fixed4 _Color;
		struct Input
		{
			float2 uv_MainTex;
		};
		
		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
}
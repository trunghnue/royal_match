Shader "Custom/TextureLoop" {
	Properties {
		[PerRendererData] _MainTex ("Main Texture", 2D) = "" {}
		[PerRendererData] _Color ("Tint", Vector) = (1,1,1,1)
		_WaveTex ("Wave", 2D) = "" {}
		_WaveTile ("Wave Tile", Float) = 1
		_WaveSpeed ("Wave Speed", Float) = 1
		_WaveOffset ("Wave Offset", Float) = 1
		_WaveRotation ("Wave Rotation", Float) = 0
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
	Fallback "Unlit/Texture"
}
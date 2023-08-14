Shader "Royal/PoolDistortion" {
	Properties {
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		DistortionUV_WaveX_1 ("DistortionUV_WaveX_1", Range(0, 1000)) = 10
		DistortionUV_WaveY_1 ("DistortionUV_WaveY_1", Range(0, 1000)) = 10
		DistortionUV_DistanceX_1 ("DistortionUV_DistanceX_1", Range(0, 1)) = 0.3
		DistortionUV_DistanceY_1 ("DistortionUV_DistanceY_1", Range(0, 1)) = 0.3
		DistortionUV_Speed_1 ("DistortionUV_Speed_1", Range(-2, 2)) = 1
		_Effect_Fade ("_Effect_Fade", Range(0, 1)) = 1
		_SpriteFade ("SpriteFade", Range(0, 1)) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Sprites/Default"
}
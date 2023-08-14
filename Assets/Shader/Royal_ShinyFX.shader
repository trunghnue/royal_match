Shader "Royal/ShinyFX" {
	Properties {
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		[PerRendererData] _ShinyFX_Pos_1 ("_ShinyFX_Pos_1", Range(-1, 1)) = 0
		[PerRendererData] _AtlasUV ("_AtlasUV", Vector) = (0,1,0,1)
		_ShinyFX_Size_1 ("_ShinyFX_Size_1", Range(-1, 1)) = -0.1
		_ShinyFX_Smooth_1 ("_ShinyFX_Smooth_1", Range(0, 1)) = 0.25
		_ShinyFX_Intensity_1 ("_ShinyFX_Intensity_1", Range(0, 4)) = 1
		_ShinyFX_Speed_1 ("_ShinyFX_Speed_1", Range(0, 8)) = 1
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
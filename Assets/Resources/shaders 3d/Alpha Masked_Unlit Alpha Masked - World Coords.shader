Shader "Alpha Masked/Unlit Alpha Masked - World Coords" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		[Toggle] [HideInInspector] [PerRendererData] _Enabled ("Mask Enabled", Float) = 1
		[Toggle] [HideInInspector] [PerRendererData] _ClampHoriz ("Clamp Alpha Horizontally", Float) = 0
		[Toggle] [HideInInspector] [PerRendererData] _ClampVert ("Clamp Alpha Vertically", Float) = 0
		[Toggle] [HideInInspector] [PerRendererData] _UseAlphaChannel ("Use Mask Alpha Channel (not RGB)", Float) = 0
		[Toggle] [HideInInspector] [PerRendererData] _ScreenSpaceUI ("Is this screen space ui element?", Float) = 0
		[HideInInspector] [PerRendererData] _AlphaTex ("Alpha Mask", 2D) = "white" {}
		[HideInInspector] [PerRendererData] _ClampBorder ("Clamping Border", Float) = 0.01
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
	Fallback "Unlit/Texture"
}
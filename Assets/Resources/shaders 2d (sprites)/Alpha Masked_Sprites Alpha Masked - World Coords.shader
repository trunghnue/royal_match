Shader "Alpha Masked/Sprites Alpha Masked - World Coords" {
	Properties {
		[PerRendererData] _MainTex ("Texture", 2D) = "white" {}
		[Toggle] [HideInInspector] [PerRendererData] _Enabled ("Mask Enabled", Float) = 1
		[Toggle] [HideInInspector] [PerRendererData] _ClampHoriz ("Clamp Alpha Horizontally", Float) = 0
		[Toggle] [HideInInspector] [PerRendererData] _ClampVert ("Clamp Alpha Vertically", Float) = 0
		[Toggle] [HideInInspector] [PerRendererData] _UseAlphaChannel ("Use Mask Alpha Channel (not RGB)", Float) = 0
		[Toggle] [HideInInspector] [PerRendererData] _ScreenSpaceUI ("Is this screen space ui element?", Float) = 0
		[HideInInspector] [PerRendererData] _AlphaTex ("Alpha Mask", 2D) = "white" {}
		[HideInInspector] [PerRendererData] _ClampBorder ("Clamping Border", Float) = 0.01
		[PerRendererData] _Color ("Tint", Vector) = (1,1,1,1)
		[Toggle] [PerRendererData] _PixelSnap ("Pixel snap", Float) = 0
		[PerRendererData] _IsThisText ("Is This Text?", Float) = 0
		[PerRendererData] _StencilComp ("Stencil Comparison", Float) = 8
		[PerRendererData] _Stencil ("Stencil ID", Float) = 0
		[PerRendererData] _StencilOp ("Stencil Operation", Float) = 0
		[PerRendererData] _StencilWriteMask ("Stencil Write Mask", Float) = 255
		[PerRendererData] _StencilReadMask ("Stencil Read Mask", Float) = 255
		[PerRendererData] _ColorMask ("Color Mask", Float) = 15
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
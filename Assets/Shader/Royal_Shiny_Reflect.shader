Shader "Royal/Shiny_Reflect" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Color ("_Color", Vector) = (1,1,1,1)
		_Distortion ("Distortion", Range(0, 1)) = 0
		_FalloffRange ("FalloffRange", Range(0, 10)) = 0
		_Intensity ("Intensity", Range(0, 1)) = 0
		_Transparency ("Transparency", Range(0, 1)) = 1
		_Interval ("Interval", Range(0, 10)) = 3
		_StartOffset ("StartOffset", Range(0, 5)) = 2.4
		_SpeedMultiplier ("SpeedMultiplier", Range(0, 10)) = 3
		_Alpha ("Alpha", Range(0, 1)) = 1
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
		[HideInInspector] _TimeOffset ("_TimeOffset", Float) = 0
		[HideInInspector] _Speed ("_Speed", Float) = 0
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
	Fallback "Sprites/Default"
}
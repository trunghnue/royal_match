Shader "Royal/Lightning" {
	Properties {
		_OuterGlowColor ("Outer Glow Color", Vector) = (0.2,0,0.9,1)
		_OuterGlowWidth ("Outer Glow Width", Range(0, 1)) = 0.2
		_OuterGlowFalloff ("Outer Glow Falloff", Range(0, 1)) = 0.5
		_InnerGlowColor ("Inner Glow Color", Vector) = (0.9,0.9,0.9,1)
		_InnerGlowWidth ("Inner Glow Width", Range(0, 1)) = 0.1
		_InnerGlowFalloff ("Inner Glow Falloff", Range(0, 1)) = 0.5
		[Toggle(LOWEND)] _LowEndEnabled ("Enable LowEnd", Float) = 0
		[Toggle(FLOWMAP)] _FlowMapEnabled ("Enable Flow Map", Float) = 0
		[NoScaleOffset] _FlowMap ("Flow Map", 2D) = "black" {}
		_FlowScalar ("Flow Strength Scalar", Float) = 0
		_FlowScrollSpeed ("Flow Scroll Speed", Float) = 1
		[Toggle(VERTDISPLACE)] _DisplaceVertices ("Displace Vertices", Float) = 1
		_LightningXOffsetScalar ("Lightning X Offset Scalar", Float) = 1
		[Toggle] _DeviceIsLandscape ("Device is Landscape", Float) = 0
		_CustomTime ("TimeDiff", Float) = 0.5
		_QuadYScale ("Quad Y Scale", Float) = 1
		_CumulativeWaveOffset ("Cumulative Wave Offset", Float) = 0
		_GrowthIndex ("Growth Index", Float) = 0
		_GenerationCount ("Generation Count", Float) = 10
		_ExtraEmitRate ("Extra Emit Rate", Range(0, 1)) = 0.9
		_RefreshRateScalar ("Refresh Rate Scalar", Float) = 60
		_WaveFrequency ("Frequency", Range(0, 8)) = 2
		_WaveAmplitude ("Amplitude", Range(0, 1)) = 0.4
		_WaveBandwidth ("Bandwidth", Float) = 1
		_WaveSpeed ("Speed", Float) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = 1;
		}
		ENDCG
	}
}
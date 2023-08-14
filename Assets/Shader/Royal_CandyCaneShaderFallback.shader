Shader "Royal/CandyCaneShaderFallback" {
	Properties {
		[HideInInspector] _TextureGroupCount ("Texture Group Count", Float) = 0
		[HideInInspector] _IsCurved ("Is Curved", Float) = 0
		[HideInInspector] _XFlip ("X Flip", Float) = 0
		[HideInInspector] _VOffsetMultiplier ("V Offset", Vector) = (0,0,0,0)
		[HideInInspector] _FlowSpeedArray ("Scroll Speeds", Vector) = (0,0,0,0)
		[HideInInspector] _FlowDirectionArray ("Flow Directions", Vector) = (0,0,0,0)
		[HideInInspector] _FramesPerSecond ("Frames Per Second", Vector) = (0,0,0,0)
		[HideInInspector] _RandomTimeOffset ("Random Time Offset", Float) = 0
		[HideInInspector] _FlowSpeed ("Scroll Speed", Float) = 0
		[HideInInspector] _FlowDirection ("Flow Direction", Float) = 0
		[HideInInspector] _FlowRotation ("Flow Rotation", Float) = 0
		[HideInInspector] _FlowOffset ("Flow Direction", Vector) = (0,0,0,0)
		[HideInInspector] _TimeOffset ("Time Offset", Float) = 0
		[HideInInspector] _RelativeTimeOffset ("Relative Time Offset", Float) = 0
		[HideInInspector] _PreviousCellCurveData ("Previous Cell Corner Data", Float) = 0
		[HideInInspector] _NextCellCurveData ("Next Cell Corner Data", Float) = 0
		[HideInInspector] _FlowDuration ("Flow Loop Duration", Float) = 0
		[HideInInspector] _TextureAtlas1 ("Texture Atlas 1", 2D) = "white" {}
		[HideInInspector] _TextureAtlas2 ("Texture Atlas 2", 2D) = "white" {}
		[HideInInspector] _TextureAtlas3 ("Texture Atlas 3", 2D) = "white" {}
		_Roundness ("Roundness", Range(0, 45)) = 10
		_SpeedScalar ("Speed Scalar", Range(-3, 3)) = 1
		_ShakeScalar ("Shake Scalar", Range(0, 10)) = 0
		_CornerToStraightBlend ("Blend Radial To Straight UVs", Range(0, 1)) = 0
		_BlendMaskOffset ("Blend Mask Offset", Range(0, 1)) = 0
		[NoScaleOffset] _HeadMask ("Head Mask Texture", 2D) = "white" {}
		[HideInInspector] _ScrollFadeStartTime ("Head is moving", Float) = 0
		[HideInInspector] _FadeCell ("Fade Cell", Float) = 0
		[NoScaleOffset] _HeadInnerShadow ("Head Inner Shadow", 2D) = "white" {}
		[NoScaleOffset] _HeadOuterShadow ("Head Outer Shadow", 2D) = "white" {}
		_NoiseTex ("Noise Texture", 2D) = "white" {}
		_Highlight1NoiseBlendWeight ("Highlight 1 Noise Blend", Range(0, 1)) = 0
		_Highlight2NoiseBlendWeight ("Highlight 2 Noise Blend", Range(0, 1)) = 0
		[HideInInspector] _MyPathIndex ("My Path Index", Float) = 0
		[HideInInspector] _PathStartOffset ("Path Start Offset", Float) = 0
		[HideInInspector] _PathLength ("Path Length", Float) = 0
		[Toggle(FADEHIGHLIGHT)] _FadeHighlightEnabled ("Enable Fade", Float) = 1
		[HideInInspector] _NeighborData ("Neighbor Data", Vector) = (0,0,0,0)
		_HighlightFadeDistance ("Highlight Fade Distance", Vector) = (0,0,0,0)
		[Header(Highlight 1)] _HighlightColor1 ("Color", Vector) = (0,0,0,0)
		[Header(Vertical)] _HighlightData1Vertical ("Width1, Width2, X Offset, Max Alpha", Vector) = (0,0,0,0)
		[Header(Horizontal)] _HighlightData1Horizontal ("Width1, Width2, X Offset, Max Alpha", Vector) = (0,0,0,0)
		[Header(Highlight 2)] _HighlightColor2 ("Color", Vector) = (0,0,0,0)
		[Header(Vertical)] _HighlightData2Vertical ("Width1, Width2, X Offset, Max Alpha", Vector) = (0,0,0,0)
		[Header(Horizontal)] _HighlightData2Horizontal ("Width1, Width2, X Offset, Max Alpha", Vector) = (0,0,0,0)
		[Header(Inner Shadow)] _InnerShadowFadeDistance ("Inner Shadow Fade Distance", Float) = 0
		_InnerShadowData ("Width1, Width2, X Offset, Max Alpha", Vector) = (0,0,0,0)
		[Header(Bottom Shadow)] _BottomShadowData ("Width1, Width2, X Offset, Max Alpha", Vector) = (0,0,0,0)
		[Toggle(LOWEND)] _IsLowEnd ("Low End", Float) = 0
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
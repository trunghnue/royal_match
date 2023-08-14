Shader "Royal/TextureScrollShader" {
	Properties {
		[HideInInspector] _TextureGroupCount ("Texture Group Count", Float) = 0
		[HideInInspector] _IsCurved ("Is Curved", Float) = 0
		[HideInInspector] _XFlip ("X Flip", Float) = 0
		[HideInInspector] _VOffsetMultiplier ("V Offset", Vector) = (0,0,0,0)
		[HideInInspector] _FlowSpeedArray ("Scroll Speeds", Vector) = (0,0,0,0)
		[HideInInspector] _FlowDirectionArray ("Flow Directions", Vector) = (0,0,0,0)
		[HideInInspector] _FramesPerSecond ("Frames Per Second", Vector) = (0,0,0,0)
		[HideInInspector] _RandomTimeOffset ("Random Time Offset", Float) = 0
		[HideInInspector] _TextureAtlas1 ("Texture Atlas 1", 2D) = "white" {}
		[HideInInspector] _TextureAtlas2 ("Texture Atlas 2", 2D) = "white" {}
		[HideInInspector] _TextureAtlas3 ("Texture Atlas 3", 2D) = "white" {}
		[HideInInspector] _TextureAtlas4 ("Texture Atlas 4", 2D) = "white" {}
		[HideInInspector] _TextureSampleLengths ("Texture Atlas Data 1", Vector) = (0,0,0,0)
		_BevelScalar ("Bevel Scalar", Range(1, 19)) = 1
		[NoScaleOffset] _MagnetMaskTex ("Magnet Mask Texture", 2D) = "white" {}
		[HideInInspector] _ScrollFadeStartTime ("Head is moving", Float) = 0
		[HideInInspector] _FadeCell ("Fade Cell", Float) = 0
		[Toggle(PATH)] _PathingEnabled ("Enable Pathing", Float) = 0
		[HideInInspector] _MyPathIndex ("My Path Index", Float) = 0
		[HideInInspector] _PathStartOffset ("Path Start Offset", Float) = 0
		[HideInInspector] _PathLength ("Path Length", Float) = 0
		[HideInInspector] _PathDataA ("Path Data A", Vector) = (0,0,0,0)
		[HideInInspector] _PathDataB ("Path Data B", Vector) = (0,0,0,0)
		[HideInInspector] _PathDataC ("Path Data C", Vector) = (0,0,0,0)
		[HideInInspector] _PathDataD ("Path Data D", Vector) = (0,0,0,0)
		[Toggle(FLOWMAP)] _FlowMapEnabled ("Enable Flow Map", Float) = 0
		[NoScaleOffset] _FlowMap ("Flow Map", 2D) = "black" {}
		_MinFlowThreshold ("Minimum Flow Threshold", Float) = 0
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
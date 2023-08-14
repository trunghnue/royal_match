Shader "RoyalMatch/Dissolve Burn" {
	Properties {
		_MainTex ("Diffuse (RGBA)", 2D) = "white" {}
		_BurnGradient ("Burn Gradient (RGB)", 2D) = "white" {}
		_NoiseTex ("Burn Map (RGB)", 2D) = "black" {}
		_GradientAdjust ("Gradient", Range(0.1, 40)) = 40
		[PerRendererData] _DissolveValue ("Value", Range(0, 1)) = 1
		[PerRendererData] _AtlasUV ("_AtlasUV", Vector) = (0,1,0,1)
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
}
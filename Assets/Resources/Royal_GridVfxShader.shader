Shader "Royal/GridVfxShader" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Resolution ("XY: Grid Resolution", Vector) = (0,0,0,0)
		_CircleSize ("Circle Size", Range(0, 1)) = 0
		_NoiseTex ("Noise Texture", 2D) = "white" {}
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
Shader "Triniti/Particle/AA_COL_DO_FADE_P2"
{
	Properties
	{
		_Color ("Main Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
		_FadeTex ("Fade Texture",2D) = "white" {}
	}

	Category
	{
		Tags { "Queue"="Transparent"}
		Blend SrcAlpha One
		ZWrite Off
		Fog { Color (0,0,0,0) }
		
		BindChannels
		{
			Bind "Color", color
			Bind "Vertex", vertex
			Bind "TexCoord", texcoord
		}
		
		SubShader
		{
			Pass
			{
			    Cull Front
			    
				SetTexture [_MainTex]
				{
					constantColor [_Color]
					combine constant * primary
				}
				SetTexture [_MainTex]
				{
					combine texture * previous double
				}

				SetTexture [_FadeTex]
				{
					combine texture * previous
				}
			}
			
			Pass
			{
			    Cull Back
			
				SetTexture [_MainTex]
				{
					constantColor [_Color]
					combine constant * primary
				}
				SetTexture [_MainTex]
				{
					combine texture * previous double
				}

				SetTexture [_FadeTex]
				{
					combine texture * previous
				}
			}
		}
	}
}


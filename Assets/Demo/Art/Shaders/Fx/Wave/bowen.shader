// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.19 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.19;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4795,x:33243,y:32864,varname:node_4795,prsc:2|normal-6650-RGB,alpha-9376-OUT,refract-3920-OUT;n:type:ShaderForge.SFN_Tex2d,id:6650,x:31570,y:32847,ptovrint:False,ptlb:node_6650,ptin:_node_6650,varname:_node_6650,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e96f70f5fde6b5f468cc99858a1b7679,ntxv:3,isnm:True;n:type:ShaderForge.SFN_NormalVector,id:1033,x:31390,y:33375,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:2315,x:31661,y:33377,varname:node_2315,prsc:2,tffrom:0,tfto:3|IN-1033-OUT;n:type:ShaderForge.SFN_ComponentMask,id:7690,x:31946,y:33377,varname:node_7690,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2315-XYZ;n:type:ShaderForge.SFN_Multiply,id:3439,x:32524,y:33375,varname:node_3439,prsc:2|A-1620-OUT,B-1797-OUT;n:type:ShaderForge.SFN_Slider,id:1797,x:32158,y:33593,ptovrint:False,ptlb:qiangdu,ptin:_qiangdu,varname:_qiangdu,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.5,cur:0,max:0;n:type:ShaderForge.SFN_ComponentMask,id:9514,x:31937,y:33025,varname:node_9514,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6650-RGB;n:type:ShaderForge.SFN_Add,id:1620,x:32281,y:33166,varname:node_1620,prsc:2|A-9514-OUT,B-7690-OUT;n:type:ShaderForge.SFN_VertexColor,id:3600,x:32520,y:33128,varname:node_3600,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3920,x:32793,y:33238,varname:node_3920,prsc:2|A-3600-A,B-3439-OUT;n:type:ShaderForge.SFN_Vector1,id:9376,x:32789,y:33086,varname:node_9376,prsc:2,v1:0;proporder:6650-1797;pass:END;sub:END;*/

Shader "Shader Forge/bowen" {
    Properties {
        _node_6650 ("node_6650", 2D) = "bump" {}
        _qiangdu ("qiangdu", Range(-0.5, 0)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _node_6650; uniform float4 _node_6650_ST;
            uniform float _qiangdu;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                float4 screenPos : TEXCOORD4;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 _node_6650_var = UnpackNormal(tex2D(_node_6650,TRANSFORM_TEX(i.uv0, _node_6650)));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (i.vertexColor.a*((_node_6650_var.rgb.rg+mul( UNITY_MATRIX_V, float4(i.normalDir,0) ).xyz.rgb.rg)*_qiangdu));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 normalLocal = _node_6650_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
////// Lighting:
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,0.0),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

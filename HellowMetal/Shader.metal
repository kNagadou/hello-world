//
//  Shader.metal
//  HellowMetal
//
//  Created by Kazumasa Nagadou on 2016/10/07.
//  Copyright © 2016年 kNagadou. All rights reserved.
//

// ちょっとここは諦めた。。。コピペ
// (Shader識別子) (戻り値) 関数名(引数){
//    // 処理内容
// }
// float4は4つのfloat値要素をもった構造値と考えれば問題ないと思います。
// たとえば、x,y,z,w(四元数）やr,g,b,a(色)などです。

// スタンダードライブラリを読み込む
#include <metal_stdlib>
using namespace metal;

// VertexShader
// 頂点の計算処理　入力の座標に対して特に何もしません。
vertex float4 myVertexShader(const device float2 * vertex_array [[ buffer(0) ]], uint vid [[ vertex_id ]]) {
    return float4(vertex_array[vid], 0, 1);
}

// Fragment Shader
// 各ピクセルの処理でぬりつぶします。別名Pixel Shaderとも呼ばれます。
fragment float4 myFragmentShader() {
    return float4(0.0, 0.0, 0.0, 1.0); // 図形内の各ピクセルの色を指定します。
}
// 露草色で塗りつぶす
fragment float4 myFragmentShaderDayflower() {
    return float4(28.0/255.0, 5.0/255.0, 1.0, 1.0);
}

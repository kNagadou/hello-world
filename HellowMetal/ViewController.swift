//
//  ViewController.swift
//  HellowMetal
//
//  *Swift3*
//
//  Created by Kazumasa Nagadou on 2016/10/07.
//  Copyright © 2016年 kNagadou. All rights reserved.
//

import UIKit
import Metal
import QuartzCore

// 0.1だと三角形が小さすぎたので、3倍の値をセット
let vertexArray: [Float] = [
    0.3, 0.3,
    -0.3, -0.3,
    0.3, -0.3
]

let myVertexShader: String = "myVertexShader"
let myFragmentShader: String = "myFragmentShaderDayflower"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let device: MTLDevice? = MTLCreateSystemDefaultDevice()
        // newCommandQueue()がRenameされてmakeCommandQueue()になったようだ
        let commandQueue: MTLCommandQueue! = device?.makeCommandQueue()
        // sizeofValue()はMemoryLayout.size(ofValue:)に変更
        let vertexLength = vertexArray.count * MemoryLayout.size(ofValue: vertexArray[0])
        // MTLResourceOptions.OptionCPUCacheModeDefaultは削除されたっぽい。
        // 代わりはMTLResourceOptions.cpuCacheModeWriteCombinedか？
        let vertexBuffer: MTLBuffer! = device?.makeBuffer(bytes: vertexArray, length: vertexLength, options: MTLResourceOptions.cpuCacheModeWriteCombined)
        
        let defaultLibrary = device?.newDefaultLibrary()
        let newVertexFunction = defaultLibrary?.makeFunction(name: myVertexShader)
        let newFragmentFunction = defaultLibrary?.makeFunction(name: myFragmentShader)
        
        let piplineStateDescriptor = MTLRenderPipelineDescriptor()
        // 頂点処理を設定
        piplineStateDescriptor.vertexFunction = newVertexFunction
        // ピクセル処理を設定
        piplineStateDescriptor.fragmentFunction = newFragmentFunction
        // 色成分の順序を設定
        piplineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        // RenderPipelineの状態を取得
        var piplineState: MTLRenderPipelineState!
        do {
            piplineState = try device?.makeRenderPipelineState(descriptor: piplineStateDescriptor)
        } catch {
            print("error with device?.makeRenderPipelineState")
        }
        
        // デバイス未接続だと、CAMetalLayerはエラーになる
        let metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm    // pipeline descriptorに設定したものと同じものを設定する。
        metalLayer.frame = view.layer.frame     // フレームサイズを設定
        view.layer.addSublayer(metalLayer)
        
        // 描画処理
        let drawable = metalLayer.nextDrawable()
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable?.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .clear    // 毎フレームクリアされる
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(
            red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0
        )
        
        let commandBuffer = commandQueue.makeCommandBuffer()
        let renderEncoder: MTLRenderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        renderEncoder.setRenderPipelineState(piplineState)
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, at: 0)
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1) // 描画
        renderEncoder.endEncoding()
        
        commandBuffer.present(drawable!)
        commandBuffer.commit()              // テクスチャ反映
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


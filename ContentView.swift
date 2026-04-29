import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 10)
                
                Text("健康食品分享")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Text("发现 · 分享 · 健康生活")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.9))
                
                Spacer()
                
                Button(action: { showDetail = true }) {
                    Text("开始使用")
                        .font(.title2)
                        .foregroundColor(.green)
                        .frame(width: 250, height: 60)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
                }
                Spacer()
                Text("v1.0.1 - AI Vision Engine Prepared") // 暗示AI引擎已准备好
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showDetail) {
            DetailView()
        }
    }
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isAnalyzing = false
    @State private var aiResult = "等待分析..."
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 25) {
                // 模拟多模态上传区域
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 250)
                    .overlay(
                        VStack {
                            Image(systemName: "camera.viewfinder")
                                .font(.system(size: 50))
                                .foregroundColor(.green)
                            Text("多模态输入区域")
                                .foregroundColor(.gray)
                        }
                    )
                
                Text("AI 营养师分析")
                    .font(.title2)
                    .fontWeight(.bold)
                
                // 模拟模型返回结果展示
                Text(aiResult)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(15)
                
                // 模拟调用 MiMo 模型的按钮
                Button(action: {
                    simulateMiMoAPIRequest()
                }) {
                    HStack {
                        Image(systemName: "sparkles")
                        Text(isAnalyzing ? "调用 MiMo-V2.5-Omni 中..." : "启动 AI 视觉分析")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 280, height: 50)
                    .background(isAnalyzing ? Color.gray : Color.green)
                    .cornerRadius(25)
                }
                .disabled(isAnalyzing)
                
                Spacer()
                
                Button(action: { dismiss() }) {
                    Text("返回主页")
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
    }
    
    // 模拟等待大模型回调的逻辑
    func simulateMiMoAPIRequest() {
        isAnalyzing = true
        aiResult = "正在构建 Prompt，请求 MiMo-V2.5-Omni..."
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isAnalyzing = false
            aiResult = "识别成功：[三文鱼沙拉]\n预估热量：320 kcal\n蛋白质：22g\n(注：此数据由 MiMo 本地模型生成)"
        }
    }
}

//
//  UserRegistView.swift
//  Kakeibo
//
//  Created by 広瀬友哉 on 2024/03/09.
//

import SwiftUI
import SwiftData

struct UserRegistView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Binding var flag: Bool
    
    @StateObject var userVM = UserSheetViewModel()
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("ユーザーID").padding(.leading)
                    Spacer()
                    TextField("ユーザー", text: $userVM.model.inputId).textFieldStyle(.plain).disabled(userVM.model.isLoading).padding(.horizontal)
                }.padding(.bottom, 10)
                Divider()
                HStack{
                    Text("ユーザー名").padding(.leading)
                    Spacer()
                    TextField("ユーザー名", text: $userVM.model.inputName).textFieldStyle(.plain).disabled(userVM.model.isLoading).padding(.horizontal)
                }.padding(.vertical)
                Divider()
                HStack{
                    Text("パスワード").padding(.leading)
                    Spacer()
                    SecureField("パスワード", text: $userVM.model.inputPass).textFieldStyle(.plain).disabled(userVM.model.isLoading).padding(.horizontal)
                }.padding(.vertical)
                Divider()
                HStack{
                    Text("ユーザー権限").padding(.leading)
                    Spacer()
                    Picker("", selection: $userVM.model.selectedAuthority) {
                        ForEach(userVM.model.authority, id: \.self){ name in
                            Text(name).tag(name)
                        }
                    }.padding(.horizontal)
                }.padding(.vertical)
                
                HStack{
                    Button("登録"){
                        userVM.model.isLoading.toggle()
                        userVM.createUser(mc: modelContext) {
                            userVM.model.isLoading.toggle()
                            self.flag.toggle()
                        }
                    }.buttonStyle(.borderedProminent).padding(.top, 5).disabled(userVM.model.inputId.isEmpty || userVM.model.inputPass.isEmpty || userVM.model.inputName.isEmpty)
                }
            }.frame(height: 400)
            if userVM.model.isLoading {
                ZStack{
                    Rectangle().frame(width: 300,height: 300).foregroundStyle(Material.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 40))
                    VStack{
                        ProgressView()
                        Text("アカウント作成中").padding(.top, 10).font(.title2)
                    }
                }
            }
        }.frame(width: 400).padding()
    }
}

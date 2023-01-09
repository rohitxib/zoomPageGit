//
//  ContentView.swift
//  ZoomePage
//
//  Created by Apple on 20/12/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var isPickup = true // toggle state

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        ZStack {
            //Background color
            Color.white
                .ignoresSafeArea(.all)
                    
            VStack {
                HeaderView()
                HeaderView2()
                Map(coordinateRegion: $region)
                            .frame(width: 400, height: 300)
                HStack{// pic drop buttons
                Button {
                    isPickup.toggle()
                    print(isPickup)
                    print("this is pickup data")
                } label: {
                    HStack {
                        Text("Pickup").foregroundColor(.black)
                        Text("05:00 AM").foregroundColor(.gray)
                }
                }.padding(.leading)
                    Spacer()
                    Button {
                        isPickup.toggle()

                        print(isPickup)
                        print("this is dropoff data")
                    } label: {
                        HStack {
                            Text("Drop off").foregroundColor(.black)
                            Text("06:00 PM").foregroundColor(.gray)
                    }
                    }.padding(.trailing)
            }
                // *********** picup & drop off panel
               // PickupDropofPannelView()
                PickupDropofPannelView.init(isPickup: $isPickup)
   
                // *********** button on the route to drop off
                CourierStatusActionButton(text: "On route to drop off", color: Color(red: 75 / 255, green: 80 / 255, blue: 84 / 255), topPadding: 20, action: {
                    print("i am in closure on the route to drop off button was tapped")
                })
                // ******** button Return to pickup
                CourierStatusActionButton(text: "Return to pickup", color: Color(red: 255 / 255, green: 71 / 255, blue: 106 / 255), topPadding: 3, action: {
                    print("i am in closure Return to pickup button was tapped")
                })
            } // top vStac
        }.padding(.top,-80) //ZStack

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// header view
struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
                print("Edit button was tapped")
            } label: {
                Image("nav_back")
            }
            Spacer()
            Text("Active details").font(.title)
            Spacer()
            Button {
                print("Whatsapp button was tapped")
            } label: {
                Image("whatsapp")
            }
            Button {
                print("Chat button was tapped")
            } label: {
                Image("icon_Chat")
                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0))
            }.padding(.trailing)
        }
    }
}
// header2
struct HeaderView2: View {
    var body: some View {
        HStack {
            Button {
                print("this is current eta")
            } label: {
                Text("ⓘ").foregroundColor(Color.white)
            }
            Text("Your ETA for pickup is 05:00 AM ▼").fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.center)
        }.frame(width: 350, height: 33, alignment: .center).padding(.leading).padding(.trailing).background(Color(red: 255 / 255, green: 71 / 255, blue: 106 / 255))

        
    }
}
// pickupDropoff view
struct PickuoDropoffView: View {
    @State var isPickup = true // toggle state
    var body: some View {
        VStack(alignment: .leading){
            Text(isPickup ? "madan gupta pickup point" : "")
            Text("9200342323")
            Text("Madan Company &Company")
        }//.padding(.leading)
    }
}
// Courier Status ButtonView
struct CourierStatusActionButton: View {
    var text: String
       var color: Color
       var topPadding: CGFloat
       var action: () -> Void
    
    var body: some View {
          Button(action: action) {
              Text(text).fontWeight(.bold)
                  .padding()
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity, maxHeight: 40)
                  .background(color)
                  .cornerRadius(5)
                  .shadow(radius: 1)
          }
          .padding(.top, topPadding)
          .padding(.horizontal)
      }
}
// buttonview whatsapp fonecal help
struct Button_Whatsapp_Call_Help: View {
    var imageName: String
       var action: () -> Void
    
    var body: some View {
          Button(action: action) {
              Image(imageName)
          }
      }
}
// pickup dropof pannel view
struct PickupDropofPannelView: View {
    @Binding var isPickup:Bool// toggle state
    
    var body: some View {

        if isPickup {
                        Text("pickup")
                    } else {
                        Text("dropoff")
                    }
        
        VStack(alignment: .leading){// PickuoDropoffView
            HStack{
                PickuoDropoffView().padding(.leading)
                Spacer()
                VStack{
                    HStack{
                        Button_Whatsapp_Call_Help(imageName: "location_marker", action: {
                            print("Map button was tapped")
                        })
                        Button_Whatsapp_Call_Help(imageName: "icon_call", action: {
                            print("Phone button was tapped")
                        })
                    }
                    Button_Whatsapp_Call_Help(imageName: "HELP_icon", action: {
                        print("Help button was tapped")
                    })
        //
                }.padding(.trailing)
            }
            Text(isPickup ? "987 Hume Highway ,Lansdowns NSW 2163,Australia" : "").padding(.leading).padding(.trailing
            ).foregroundColor(.gray).lineLimit(2)
        }
      }
}

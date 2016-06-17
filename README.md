# RadioDemo

let radio = TCRadio(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
radio.setRadios(["男","女"], direction:.TCRadiosDirH , selectItem: 0)
radio.delegate = self
self.view.addSubview(radio)

extension ViewController:TCRadioItemDelegate{

    func clickRadio(str:String) {
        print("radio...\(str)")
    }
}

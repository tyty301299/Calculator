//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyen Ty on 02/09/2021.
//

import UIKit

class ViewController: UIViewController {
    var Str = ""
    var kq = 0
    var checkmoon = true
    var check = true
    var colornumber = UIColor(red: 229/255, green: 134/255, blue: 124/255, alpha: 1)
    var colordarknumber = UIColor(red: 136/255, green: 176/255, blue: 226/255, alpha: 1)
    var colordarkfirst = UIColor(red: 96/255, green: 179/255, blue: 220/255, alpha: 1)
    var colornfirst = UIColor(red: 147/255, green: 196/255, blue: 221/255, alpha: 1)
    var colordarkpt = UIColor(red: 29/255, green: 80/255, blue: 156, alpha: 1)
    var colorpt = UIColor(red: 48/255, green: 93/255, blue: 154/255, alpha: 1)
    var colormoon = UIColor(red: 192/255, green: 181/255, blue: 91/255, alpha: 1)
    
    @IBOutlet weak var igmoon: UIImageView!
    @IBOutlet weak var collview: UICollectionView!
    var colorlb = UIColor(red: 47/255, green: 93/255, blue: 156/255, alpha: 1)
    var colorsz = UIColor(red: 229/255, green: 134/255, blue: 121/255, alpha: 1)
    var data = ["AC","+/-","%",":","7","8","9","X","4","5","6","-","1","2","3","+","0",".","="]
    @IBOutlet weak var lbkq: UILabel!
    var viewNumber = UIView()
    @IBOutlet weak var viewsecond: UIView!
    @IBOutlet weak var viewfirst: UIView!
    var viewOne = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
      setupviewfirst()
        setupviewsecond()
        setupcollview()
       setuplable()
        setupigmoon()
    }
    func setupigmoon() {
        let w = ((self.view.frame.width - 100 ) / 10)
        viewfirst.addSubview(igmoon)
        igmoon.translatesAutoresizingMaskIntoConstraints = false
        igmoon.topAnchor.constraint(equalTo: viewfirst.topAnchor, constant: w*2).isActive = true
        igmoon.leadingAnchor.constraint(equalTo: viewfirst.leadingAnchor, constant: 20).isActive = true
        igmoon.widthAnchor.constraint(equalToConstant: w).isActive = true
        igmoon.heightAnchor.constraint(equalToConstant: w).isActive = true
        igmoon.tintColor = colormoon
        if checkmoon == true {
            igmoon.image = UIImage(systemName: "moon")
           
        }
        else {
            igmoon.image = UIImage(systemName: "sun.max")
        }
        igmoon.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(taponmoon))
        igmoon.addGestureRecognizer(tap)
    }
    @objc func taponmoon() {
        if checkmoon == true {
            igmoon.image = UIImage(systemName: "moon")
            
        }
        else {
            igmoon.image = UIImage(systemName: "sun.max")
           
        }
        setupviewcontainer()
        checkmoon = !checkmoon
        collview.reloadData()
       print(checkmoon)
    }
    func setupviewcontainer(){
        if checkmoon {
            
            view.backgroundColor = .black
            lbkq.textColor = .white
            
        }
        else{
            view.backgroundColor = .white
            lbkq.textColor = colorlb
        }
        viewfirst.backgroundColor = .clear
        viewsecond.backgroundColor = .clear
        collview.backgroundColor = .clear
    }
    func setuplable() {
        let w = ((self.view.frame.width - 100 ) / 4)
        viewfirst.addSubview(lbkq)
        lbkq.translatesAutoresizingMaskIntoConstraints = false
        lbkq.bottomAnchor.constraint(equalTo: viewfirst.bottomAnchor, constant: -20).isActive = true
        lbkq.trailingAnchor.constraint(equalTo: viewfirst.trailingAnchor, constant: -20).isActive = true
        lbkq.font = UIFont.systemFont(ofSize: w)
        lbkq.text = "0"
        lbkq.textColor = colorlb
    }
    func setupcollview() {
        viewsecond.addSubview(collview)
        let w = ((self.view.frame.width - 100 ) / 4)
        collview.translatesAutoresizingMaskIntoConstraints = false
        collview.centerXAnchor.constraint(equalTo: viewsecond.centerXAnchor).isActive = true
        collview.centerYAnchor.constraint(equalTo: viewsecond.centerYAnchor).isActive = true
        collview.widthAnchor.constraint(equalToConstant: view.frame.width-40).isActive = true
        collview.heightAnchor.constraint(equalToConstant: view.frame.width-20 + w).isActive = true
        collview.delegate = self
        collview.dataSource = self
        let nib = UINib(nibName: "ClickCollCell", bundle: nil)
        collview.register(nib, forCellWithReuseIdentifier: "clickCollCell")
    }
    func setupviewfirst() {
        view.addSubview(viewfirst)
        viewfirst.translatesAutoresizingMaskIntoConstraints = false
        viewfirst.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewfirst.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewfirst.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewfirst.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
    
    }
    func setupviewsecond() {
        view.addSubview(viewsecond)
        viewsecond.translatesAutoresizingMaskIntoConstraints = false
        viewsecond.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewsecond.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewsecond.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewsecond.heightAnchor.constraint(equalToConstant: view.frame.height*3/4).isActive = true
        
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let w = ((self.view.frame.width - 100 ) / 4)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clickCollCell", for: indexPath) as! ClickCollCell
        let coutry = data[indexPath.item]
        cell.lbnumber.text = coutry
        
        switch  coutry {
        case "AC":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colornfirst,color1: colordarkfirst,heghit:  20)
            
            break
        case "+/-":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colornfirst,color1: colordarkfirst,heghit:  20)
            break
        case "%":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colornfirst,color1: colordarkfirst,heghit:  20)
            break
        case ":":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colorpt ,color1: colordarkpt, heghit: w/2 )
            break
        case "X":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colorpt ,color1: colordarkpt, heghit: w/2 )
            break
        case "-":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colorpt ,color1: colordarkpt, heghit: w/2 )
            break
        case "+":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colorpt ,color1: colordarkpt, heghit: w/2 )
            break
        case "=":
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colorpt ,color1: colordarkpt, heghit: w/2 )
            break
        default:
            cell.viewcell = setupview(name: cell.viewcell, colorbg: colornumber, color1: colordarknumber, heghit: w/2)
            break
        }
        
        return cell
    }
   
    func setupview(name : UIView, colorbg : UIColor,color1:UIColor, heghit: CGFloat) -> UIView {
        
        name.layer.masksToBounds = true
        name.layer.cornerRadius = heghit
        name.backgroundColor = colorbg
        if checkmoon {
            name.backgroundColor = colorbg
        }
        else {
            name.backgroundColor = color1
        }
        return name
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = ((self.view.frame.width - 100 ) / 4)
        print(w)
        print(self,view.frame.width)
        if data[indexPath.item] == "0" {
            return CGSize(width: w*2 + 20 , height: w)
        }
        else {
            return CGSize(width: w, height: w)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if data[indexPath.item] == "=" {
            if Str  == "" {
                lbkq.text = "0"
            }
            else {
                var caclu = calculator(str: Str, result: "");
                caclu.createarr()
                if(caclu.result == ""){
                    lbkq.text = "0"
                }
                else{
                    lbkq.text = caclu.result
                }
                Str = ""
            }
        }
        else{
            if(data[indexPath.item] == "AC"){
                Str = ""
                lbkq.text = "0"
            }
            else{
                Str += data[indexPath.item]
                lbkq.text = data[indexPath.item]
            }
           
        }
}
}


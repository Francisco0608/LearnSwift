import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playMusic(tag: sender.tag);
    }
    
    private func playMusic(tag: Int){
        let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav");
        do {
            player = try AVAudioPlayer(contentsOf: url!);
            player.play();
        } catch{
            print(error);
        }
    }
  

}


class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.new
    @microposts = Micropost.page(params[:page]).per(5)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @microposts = Micropost.page(params[:page]).per(5)
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.invalid?
      @micropost.content = "なんか入力しろよ！"
      @micropost.save
      redirect_to @micropost
    else
      original_content = @micropost.content
      synth = WordSynth.new
      effector = []
      effector << Effects.kami1
      effector << Effects.kami2
      effector << Effects.kami3
      effector << Effects.kami4
      numbers = [0,0,0,1,1,1,1,1,1,2,3,4]
      number = numbers.sample
      effects = effector.sample(number)
      effects.each do | effect|
        synth.add_effect(effect)
      end
      @micropost.content = synth.play(@micropost.content)
      if original_content == @micropost.content
        @micropost.toggle(:success)
      end
      @micropost.content += "!!"
      @micropost.save
      redirect_to @micropost
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end

module Effects
  def self.kami1
    ->(words) do
      array = words.split("")
      kami1 = array[0..3] << "っ"
      (kami1 << array).join
    end
  end

  def self.kami2
    ->(words) do
      words.sub(/あ|か|さ|た|な|は|ま|や|ら|は/){|char| "#{char}っ#{char}" }
    end
  end

  def self.kami3
    ->(words) do
      array = words.split("")
      (array << array[-1]).join
    end
  end

  def self.kami4
    ->(words) do
      words.gsub!("さ","た")
      words.gsub!("し","ち")
      words.gsub!("す","つ")
      words.gsub!("せ","て")
      words.gsub!("そ","と")
      words
    end
  end
end

class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    @effects.inject(original_words) do |words, effect|
      effect.call(words)
    end
  end
end

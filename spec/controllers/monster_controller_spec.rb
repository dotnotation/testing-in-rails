describe MonstersController, type: :controller do
    let(:attributes) do
      {
        name: "Dustwing",
        size: "tiny",
        taxonomy: "Abradacus nonexistus"
      }
    end
  
    it "renders the show template" do
      monster = Monster.create!(attributes)
      get :show, id: monster.id
      expect(response).to render_template(:show)
    end
  
    describe "creation" do
      before { post :create, monster: attributes }
      let(:monster) { Monster.find_by(name: "Dustwing") }
  
      it "creates a new monster" do
        expect(monster).to_not be_nil
      end
  
      it "redirects to the monster's show page" do
        expect(response).to redirect_to(monster_path(monster))
      end
    end
  end
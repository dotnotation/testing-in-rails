describe "monster creation", type: :feature do
    before do
      visit new_monster_path
      fill_in "Name", with: "Dustwing"
      select "tiny", from: "monster_size"
      fill_in "Taxonomy", with: "Abradacus nonexistus"
      click_button "Create Monster"
    end

    let(:monster) { Monster.find_by(name: "Dustwing") }

    it "creates a monster" do
      expect(monster).to_not be_nil
    end
  
    it "redirects to the new monster's page" do
      expect(current_path).to eq(monster_path(monster))
    end

    it "displays the monster's name" do
        within "h1" do
          expect(page).to have_content(monster.name)
        end
    end
end

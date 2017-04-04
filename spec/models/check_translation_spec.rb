require 'rails_helper'

describe CheckTranslation do

  describe ".call" do
    # subject <=> context
    subject { CheckTranslation.call(params: { card_id: 1, translation: "hello" }) }

    context "when give valid values" do

      it "has correct translation data" do
        expect(subject.card.translated_text).to eq("hello")
      end

      it "has +3 days update" do
        #expect(subject.notice).to eq("Перевод верный, дата карточки обновлена")
        expect(subject.success?).to be true
      end
    end
  end

  describe ".call" do
    subject { CheckTranslation.call(params: { card_id: "", translation: "hello" }) }
    it "does not find in data base" do
      expect(subject.failure?).to be true
    end
  end

  describe ".call" do
    subject { CheckTranslation.call(params: { card_id: 1, translation: "hell" }) }
      it "is uncorrect translation" do
        expect(subject.notice).to eq('Неверный ввод, попробуй другое слово!')
      end
    end
end

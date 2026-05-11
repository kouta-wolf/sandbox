require_relative '../main'

RSpec.describe UserValidator do
  describe ".validate" do
    it "全ての条件を満たすときに有効であること" do
      result = UserValidator.validate("test1234", "Test5678")
      expect(result[:valid]).to be true
    end

    context "ユーザー名のバリデーション" do
      it "ユーザー名が短すぎると無効であること" do
        result = UserValidator.validate("Te", "Test5678")
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("ユーザー名は3文字以上で入力してください")
      end

      it "ユーザー名が長すぎると無効であること" do
        result = UserValidator.validate("TestTestTestTest", "Test5678") # user名は16文字
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("ユーザー名は15文字以内で入力してください")
      end

      it "ユーザー名に全角文字があると無効であること" do
        result = UserValidator.validate("Ｔest", "Test5678") # user名に全角文字
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("ユーザー名は半角英数字で入力してください")
      end
    end

    context "パスワードのバリデーション" do
      it "パスワードに数字が含まれていないと無効であること" do
        result = UserValidator.validate("test1234", "Password")
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("パスワードには数字を含めてください")
      end

      it "パスワードが短すぎると無効であること" do
        result = UserValidator.validate("test1234", "p1P")
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("パスワードは8文字以上で入力してください")
      end

      it "パスワードに英大文字が含まれていないと無効であること" do
        result = UserValidator.validate("test1234", "password1234")
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("パスワードは英大文字を含めて入力してください")
      end

      it "パスワードに英小文字が含まれていないと無効であること" do
        result = UserValidator.validate("test1234", "PASSWORD1234")
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("パスワードは英小文字を含めて入力してください")
      end

      it "パスワードに数字が含まれていないと無効であること" do
        result = UserValidator.validate("test1234", "Password")
        expect(result[:valid]).to be false
        expect(result[:errors]).to include("パスワードは数字を含めて入力してください")
      end
    end
  end
end

class UserValidator
  def self.validate(username, password)
    errors = []

    # ユーザー名のバリデーション
    errors << "ユーザー名は3文字以上で入力してください" if username.length < 3
    errors << "ユーザー名は15文字以内で入力してください" if username.length > 15
    errors << "ユーザー名は半角英数字で入力してください" if username.match?(/[^a-zA-Z0-9]/)

    # パスワードのチェック
    errors << "パスワードは8文字以上で入力してください" if password.length < 8
    errors << "パスワードは英大文字を含めて入力してください" if password.count("A-Z") == 0
    errors << "パスワードは英小文字を含めて入力してください"   if password.count("a-z") == 0
    errors << "パスワードは数字を含めて入力してください" if password.count("0-9") == 0
    
    # 出力
    { valid: errors.empty?, errors: errors } # valid: true, errors: []
  end
end

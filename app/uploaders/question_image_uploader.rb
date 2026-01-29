class QuestionImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # 保存先の設定
  storage :file

  # アップロード先のディレクトリ
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # ✅ 画像のリサイズ処理
  process resize_to_limit: [ 1200, 1200 ]

  # ✅ 複数バージョンの作成
  version :thumb do
    process resize_to_fill: [ 300, 300 ]
  end

  version :medium do
    process resize_to_fill: [ 600, 600 ]
  end

  # アップロード可能な拡張子
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # ファイル名の変更（オプション）
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end

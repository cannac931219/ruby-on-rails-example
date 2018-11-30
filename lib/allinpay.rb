require 'nokogiri'
class Allinpay
	def initialize
  # 配置文件
    @allinpay_config = Rails.application.config.allinpay
    # private key
    private_file = File.open(Rails.root.join('lib/allinpay/qdw_private_key.p12'))
    private_key = OpenSSL::PKCS12.new(private_file, @allinpay_config['password']).key.export
    @rsa_private = OpenSSL::PKey::RSA.new private_key
    # public key
    public_file = File.open(Rails.root.join('lib/allinpay/allinpay-pds.cer'))
    public_key = OpenSSL::X509::Certificate.new(public_file).public_key.export
    @rsa_public = OpenSSL::PKey::RSA.new(public_key)
  end
  def signature_generate(str)
    @rsa_private.sign("sha1", str.force_encoding("GBK"))
  end
  def test(str)
  	str = str
  end
end
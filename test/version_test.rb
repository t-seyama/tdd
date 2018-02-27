require 'minitest/autorun'
require './models/version.rb'

describe Version do
  describe 'version_string' do
    it 'バージョン1.0.0を返す' do
      version = Version.new(1, 0, 0)
      assert_equal '1.0.0', version.version_string
    end

    it 'バージョン2.3.4を返す' do
      version = Version.new(2, 3, 4)
      assert_equal '2.3.4', version.version_string
    end

    it 'マイナスを入れた場合にTypeErrorを返す' do
      assert_raises TypeError do
        Version.new(2, 3, -4)
      end
    end

    it '小数を入れた場合にTypeErrorを返す' do
      assert_raises TypeError do
        Version.new(2, 0.3, 4)
      end
    end

    it '引数がない場合にバージョン0.1.0を返す' do
      version = Version.new
      assert_equal '0.1.0', version.version_string
    end
  end

  describe 'version_up' do
    it 'バージョン2.3.4をmajorバージョンアップした場合に3.0.0を返す' do
      version = Version.new(2, 3, 4)
      version.major_version_up
      assert_equal version.version_string, '3.0.0'
    end

    it 'バージョン2.3.4をminorバージョンアップした場合に2.4.0を返す' do
      version = Version.new(2, 3, 4)
      version.minor_version_up
      assert_equal '2.4.0', version.version_string
    end

    it 'バージョン2.3.4をpatchバージョンアップした場合に2.3.5を返す' do
      version = Version.new(2, 3, 4)
      version.patch_version_up
      assert_equal '2.3.5', version.version_string
    end
  end

  describe 'compare' do
    it 'バージョン2.3.4のインスタンスを2つ比較した場合に、バージョンが等しい場合は0を返す' do
      version_1 = Version.new(2, 3, 4)
      version_2 = Version.new(2, 3, 4)
      assert_equal 0, Version.compare(version_1, version_2)
    end

    it 'バージョン2.3.4とバージョン3.3.4比較した場合に、-1を返す' do
      version_1 = Version.new(2, 3, 4)
      version_2 = Version.new(3, 3, 4)
      assert_equal -1, Version.compare(version_1, version_2)
    end

    it 'バージョン2.3.4とバージョン1.3.4比較した場合に、1を返す' do
      version_1 = Version.new(2, 3, 4)
      version_2 = Version.new(1, 3, 4)
      assert_equal 1, Version.compare(version_1, version_2)
    end

    it 'バージョン2.3.4とバージョン2.4.4比較した場合に、-1を返す' do
      version_1 = Version.new(2, 3, 4)
      version_2 = Version.new(2, 4, 4)
      assert_equal -1, Version.compare(version_1, version_2)
    end

    it 'バージョン2.3.4とバージョン2.2.4比較した場合に、1を返す' do
      version_1 = Version.new(2, 3, 4)
      version_2 = Version.new(2, 2, 4)
      assert_equal 1, Version.compare(version_1, version_2)
    end

    it 'バージョン2.3.4とバージョン2.3.5比較した場合に、-1を返す' do
      version_1 = Version.new(2, 3, 4)
      version_2 = Version.new(2, 3, 5)
      assert_equal -1, Version.compare(version_1, version_2)
    end
  end
end

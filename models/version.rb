class Version
  attr_reader :major, :minor, :patch

  def initialize(major = 0, minor = 1, patch = 0)
    raise TypeError if !major.is_a?(Integer) || !minor.is_a?(Integer) || !patch.is_a?(Integer)
    raise TypeError if major < 0 || minor < 0 || patch < 0
    @major = major
    @minor = minor
    @patch = patch
  end

  def self.compare(version_a, version_b)
    major_result = compare_major(version_a, version_b)
    return major_result if major_result != 0
    minor_result = compare_minor(version_a, version_b)
    return minor_result if minor_result != 0
    compare_patch(version_a, version_b)
  end

  def self.compare_major(version_a, version_b)
    return -1 if version_a.major < version_b.major
    return 0 if version_a.major == version_b.major
    return 1 if version_a.major > version_b.major
  end

  def self.compare_minor(version_a, version_b)
    return -1 if version_a.minor < version_b.minor
    return 0 if version_a.minor == version_b.minor
    return 1 if version_a.minor > version_b.minor
  end

  def self.compare_patch(version_a, version_b)
    return -1 if version_a.patch < version_b.patch
    return 0 if version_a.patch == version_b.patch
    return 1 if version_a.patch > version_b.patch
  end

  def version_string
    "#{@major.to_s}.#{@minor.to_s}.#{@patch.to_s}"
  end

  def major_version_up
    @major += 1
    @minor = 0
    @patch = 0
  end

  def minor_version_up
    @minor += 1
    @patch = 0
  end

  def patch_version_up
    @patch += 1
  end
end

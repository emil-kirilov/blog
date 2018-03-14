module FileHelper
  ASSETS_PATH_REGEX = %r{(\/public|\/app\/assets)(.+)}

  def asset_pathh(path)
    _, asset_path = path.match(ASSETS_PATH_REGEX).captures
    asset_path
  end
end

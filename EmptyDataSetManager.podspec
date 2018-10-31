Pod::Spec.new do |s|

s.name         = "EmptyDataSetManager"
s.version      = "1.0.0"
s.summary      = "The class is based on the development on the basis of DZNEmptyDataSet.Use the class may need to know DZNEmptyDataSet."

s.homepage     = "https://github.com/dreamCC/EmptyDataSetManager"

s.license      = "MIT"

s.author       = { "AbelZ" => "568644031@qq.com" }


s.platform     = :ios, "8.0"


s.source       = { :git => "https://github.com/dreamCC/EmptyDataSetManager.git", :tag => s.version }

s.source_files  = "EmptyDataSetManager/*.{h,m}"


s.requires_arc = true

end

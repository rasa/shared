// version.hpp

#ifndef VERSION
#define VERSION

#pragma warning(disable : 4505 4710)
#pragma comment(lib, "version.lib")

#include <string>
#include <sstream>
#include <iomanip>
#include <exception>
#include <new>
#include <windows.h>

namespace version_nmsp {
	struct language   {
			WORD language_;
			WORD code_page_;

		language() {
			language_  = 0;
			code_page_ = 0;
		}
	};
}

class version {

public:
	version(std::string filename) {
		resource_data_ = NULL;

		// Get version info
		DWORD h = 0;

		DWORD resource_size = ::GetFileVersionInfoSize(filename.c_str(), &h);

		if (!resource_size) {
//			throw std::exception(); // "Version information not found");
			return;
		}

		resource_data_ = new unsigned char[resource_size];
		if (!resource_data_) {
			throw std::bad_alloc();
			return;
		}

		if (::GetFileVersionInfo(
			const_cast<char*>(filename.c_str()),
			0,
			resource_size,
			static_cast<LPVOID>(resource_data_)) == 0) {
				throw std::exception("Version information not available");
				return;
		}

		UINT size = 0;

		// Get language information
		if (::VerQueryValue(
			static_cast<LPVOID>(resource_data_),
			"\\VarFileInfo\\Translation",
			reinterpret_cast<LPVOID*>(&language_information_),
			&size) == 0) {
				throw std::exception("Localized version information not available");
		}
	}

	~version() { delete [] resource_data_; }
	std::string get_product_name() const { return get_value("ProductName"); }
	std::string get_internal_name() const { return get_value("InternalName"); }
	std::string get_product_version() const { return get_value("ProductVersion"); }
	std::string get_special_build() const { return get_value("SpecialBuild"); }
	std::string get_private_build() const { return get_value("PrivateBuild"); }
	std::string get_copyright() const { return get_value("LegalCopyright"); }
	std::string get_trademarks() const { return get_value("LegalTrademarks"); }
	std::string get_comments() const { return get_value("Comments"); }
	std::string get_company_name() const { return get_value("CompanyName"); }
	std::string get_file_version() const { return get_value("FileVersion"); }
	std::string get_file_description() const { return get_value("FileDescription"); }
	std::string get_original_filename() const { return get_value("OriginalFilename"); }

	std::string get_value(const std::string &key) const {
		if (!resource_data_)
			return "";

		// Build query string
		std::stringstream t;
		t << "\\StringFileInfo\\" << std::setw(4) << std::setfill('0') << std::hex
			<< language_information_->language_ << std::setw(4) << std::hex
			<< language_information_->code_page_ << "\\" << key;

		UINT              size   = 0;
		LPVOID            value  = 0;

		if(::VerQueryValue(
			static_cast<LPVOID>(resource_data_),
			const_cast<LPTSTR>(t.str().c_str()),
			static_cast<LPVOID*>(&value),
			&size) > 0)
				return static_cast<LPTSTR>(value);

		return "";
	};

private:
	unsigned char          *resource_data_;
	version_nmsp::language *language_information_;

};

#endif

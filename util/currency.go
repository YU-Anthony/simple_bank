package util

const (
	USD = "USD"
	EUR = "EUR"
	CAD = "CAD"
	HRK = "HRK"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, CAD, HRK:
		return true
	}
	return false
}

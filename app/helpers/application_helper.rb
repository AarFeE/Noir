module ApplicationHelper
    def gradient_classes(color)
      case color
      when :home
        'from-purple-600 to-blue-500'
      when :search
        'from-teal-300 to-lime-300'
      when :carts
        'from-cyan-500 to-blue-500'
      when :about
        'from-red-200 via-red-300 to-yellow-200'
      else
        'from-gray-500 to-gray-700' # Default gradient
      end
    end
  
    def focus_ring_classes(color)
      case color
      when :home
        'focus:ring-blue-300 dark:focus:ring-blue-800'
      when :search
        'focus:ring-lime-200 dark:focus:ring-lime-800'
      when :carts
        'focus:ring-cyan-200 dark:focus:ring-cyan-800'
      when :about
        'focus:ring-red-100 dark:focus:ring-red-400'
      else
        'focus:ring-gray-300 dark:focus:ring-gray-700' # Default focus ring
      end
    end
  end
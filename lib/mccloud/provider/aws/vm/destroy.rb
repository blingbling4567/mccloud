module Mccloud::Provider
  module Aws
    module VmCommand

      def destroy(options)

        unless raw.nil? || raw.state == "shutting-down" || raw.state =="terminated"
          env.ui.info "[#{@name}] - Destroying machine (#{raw.id})"
          raw.destroy

          raw.wait_for {  print "."; STDOUT.flush; state=="terminated"}
          env.ui.info ""
        else
          env.ui.info "[#{@name}] - Machine is already terminated #{@raw.id}"
        end

      end

    end #module
  end #module
end #module

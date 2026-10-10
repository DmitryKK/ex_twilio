defmodule ExTwilio.SipCredential do
  @moduledoc """
  Represents an SIP Credential in the Twilio API.

  Credentials belong to a `ExTwilio.SipCredentialList`, so the
  `:sip_credential_list` option is required for every call.

  Create requires `:username` and `:password`. Only `:password` can be
  updated. Twilio never returns the password.

  ## Examples

      ExTwilio.SipCredential.create(
        [username: "alice", password: "Str0ngPassw0rd"],
        sip_credential_list: "CL..."
      )

      ExTwilio.SipCredential.update("CR...", [password: "N3wStr0ngPassw0rd"],
        sip_credential_list: "CL..."
      )

  - [Twilio docs](https://www.twilio.com/docs/voice/sip/api/sip-credential-resource)
  """

  defstruct sid: nil,
            account_sid: nil,
            credential_list_sid: nil,
            username: nil,
            date_created: nil,
            date_updated: nil,
            uri: nil

  use ExTwilio.Resource,
    import: [
      :stream,
      :all,
      :find,
      :create,
      :update,
      :destroy
    ]

  def resource_name, do: "Credentials"
  def resource_collection_name, do: "credentials"
  def parents, do: [:account, :sip_credential_list]
end
